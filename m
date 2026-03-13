Return-Path: <linux-arm-msm+bounces-97332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAAqNfu4s2nbaAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:12:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E30927E996
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 08:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A69643005996
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 07:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15D8365A13;
	Fri, 13 Mar 2026 07:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLsk2OC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dhHMvDLb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E3B221F2F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385953; cv=none; b=DKc3Ut1NGLtQ57S29wSZwmi2OWidz8Sj0P8F3CARBB0a/QiFNMTF4SrlSxyWW4MUNnrFeq1FVeFyokz6A0AIO9KzdtPQkZB5Vp5pyOamsDWFK76+fTLSijTK40d6y3vGhBJOCxCSGppvcdP2rE7cQFgvEp59EQLiCapIjcZ8XuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385953; c=relaxed/simple;
	bh=8AMzBbhJPBeUt5jt7kk1OhmLI6J1crW5JOlqSMud0a4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rVH0pCq0NkAP70Deh/l1JGr+JmZGQpSZVJW6P/Tl09mI7zHJRdjvCCHwqiHh9h+J28tYG1d6VS5UV1oIwLu/WFrmRmsrQgMK4Bzwuut0lmF3v7DltRUS3Ksx+txxjo79O/E5hEb5nBvZ4DEJf06qYS4C2GrZHVjx/0ulLpOiMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLsk2OC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dhHMvDLb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5thVD070734
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8EDnjQTGGFxIkB/AfhBobgmAh+JZlBOG+lFaq2bx50=; b=RLsk2OC0bNo7N+3D
	A6LIp8T4jpaIaRnoRoM9YjrVRIqzaWKmiMeC7BiiEjZ2mG19TUO9hXQ4FpywttQD
	hliZaeVumsW1Lb14JETZDpqlxuGlagWUEyd35ypA+FHdZEFqbAfcFMGwliYsfpQn
	ceq3F6Job3kCKufoUaYgWM0B8xga67t69ziZEey42q7QoEwW7M3Ps7tQqlFnKqZ6
	Ows4WOlQt8iF0GRMfbGSLaCoS9kAWuVIKJ8+43XmkFyjlMHNz24+mdwLky716ORL
	fmK5ljnRf0n0Uxi6GT29MD++yvuMEhpBDSmMJnqqVaSIcVkS5yXLFVu/u0a4bJFd
	8JBWPw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4ymxn8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 07:12:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a0b51eb23so1273234a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 00:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385950; x=1773990750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8EDnjQTGGFxIkB/AfhBobgmAh+JZlBOG+lFaq2bx50=;
        b=dhHMvDLbhrDQqLi3iby/itSezUYA3+vv6oNQag8Cvbc38BfncYju5NWoy1ifyoI6v/
         +ze+212s+dcSeJF1fm2duPPj3/Swa+DcjOgNJ1MofVxgmu5OhMt1B8H0y+ghoGtpt+qP
         PyV8UI7No1e19CF7dH41/HiSTQUY6JEaZlUEbjv6NL8okdvC5Rq6TCaPXcFgqaAdWfqq
         J2wKD5b0kttIb298Jk6QApsVhO6LS+/mzqS+BwbL/jW7Lz1Gc/8GYtPlpptYhmTaM8PJ
         HilCrjl/BbMn9Mbu3FO1uXILVCZXUpW05JaqSGkeNr/yLarnlA0HBr5VZgR4pNIADNbP
         C3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385950; x=1773990750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8EDnjQTGGFxIkB/AfhBobgmAh+JZlBOG+lFaq2bx50=;
        b=R0/x2Iaid3aRzg9kVtjMRlzh/2XN4qX8PtS2wp6nEyXoux54cssrzyOuVOhkHYdmQ9
         f4HPnElWpeOoBra7FV0KE3E2WMmG7GpBKkVaS8IMi8N+6SiUtIz+LWOxIrMQgOXYZ4sJ
         GSJ/g/xeUGb1GtfA+ErLWl1xcaRs2M8JMkdAhNIDKpvK4SazEZVYOc/EF2Psete7Rd9z
         mDnLmAxac6x2HZ6lEhxmbmjXwximaUBBjIiXsPJgwAt1chjuy37DfXwi4r/aeTfAR75M
         oEqW/NVRpNMCtVtiooFrQNLyNrXZTwhtFcf6hS6RChMMmjcEd2BJbZFYrBfUPY6UKjeA
         ChVA==
X-Forwarded-Encrypted: i=1; AJvYcCWaMhrE/mfpYI/X7o5AXqxUfKgqQIqosyYjhad/92v+QYWiO4HL0YE0fhSSZ4n3haYzXhIwb59aQI2HkgVi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz62Olte4Fc/6Wfw43sbHt6ZJzxlcc5mrxi+2LC3UkVy64QJuV1
	NtK5+E8wXViIm4L3YoLx63rxUbMrVxnswseYjqe+0rQ6Vqboz0aYy6Ww/LRCT6H2F1phbs/GAu5
	M80yONrjB8fZkMquqlXRCHrzqZRqqaHrU+ORhve+sfR2MFfjvs6HiW3JSN74A42VSNfMH
X-Gm-Gg: ATEYQzx5ifCzuv/QXCIa9KgfKUZPw6A7eL+G5eiMwzjPlbwHQnSnad2RKGo63i5Rkks
	FTv/xS4IJUz9DHPA6yQiYZ/n3rcbG1eLayktu/WfBKQrN/HRXSngAxqeiBnfxylX4jnuPf63F3C
	PWJBM317EyTVbGvVKLW3GO0bbZ9sn8g/onkEwCvjLfyx7JhGJ3YVkWRyWTiyiSgLe1df7BZ2b41
	KBPjDkeO1q99PmSPrq2KjIIPHA+rHKUMGgw8fhQDJfBwL4uPAaxP/RidCBuqJqsyPymDhlR8tlJ
	V6iQn1DNvTOQut4ZbEjUnXKnHKsVwdBpEE5IKjF/FGLHbUIxq7R0cnhmyw+Bshm+L9WhqStkq9d
	7axsuLD2npnaageGbuPRhz4zNB0KPThpbFs8fIphocTRPl2oFf3PU
X-Received: by 2002:a17:90b:498b:b0:359:15c8:e8e1 with SMTP id 98e67ed59e1d1-35a220532eamr1923672a91.25.1773385950530;
        Fri, 13 Mar 2026 00:12:30 -0700 (PDT)
X-Received: by 2002:a17:90b:498b:b0:359:15c8:e8e1 with SMTP id 98e67ed59e1d1-35a220532eamr1923642a91.25.1773385950084;
        Fri, 13 Mar 2026 00:12:30 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a245b3e97sm470040a91.10.2026.03.13.00.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 00:12:29 -0700 (PDT)
Message-ID: <36c3bc1f-99ac-ad49-8a35-85e6c0c7594a@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:42:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 6/8] media: qcom: iris: move get_instance to
 iris_hfi_sys_ops
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-iris-platform-data-v4-0-14927df4906d@oss.qualcomm.com>
 <20260313-iris-platform-data-v4-6-14927df4906d@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260313-iris-platform-data-v4-6-14927df4906d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NyBTYWx0ZWRfXwC4rZRvMjvCI
 4dhnT7vajw/LWlv6ROi32HhvFFw/wgInigbQLhPGU6kq+hpAH5U30Q12WgXrJTY5UEeo1KGXgIG
 bGsbSjSskOyfYhee1fcI7T2yV8HAhU2oYuYMAS0YBVtgpsUgoRA6mwmYKK1arlHXlAn0r2alBOS
 1oUbdEInFLJvW4omHx0octcT+aiHTD6v2WDB0X3eVImVGwPKUPJlNE/ipL18vRz9orfVtl987nG
 7uj3riNurVWu5fK7fpH43codXAKGi2mHc1Wb1nV0/htctJyDMLvMEvuKFpHMUwkv+o/Skk28uRM
 /cg5ag+IdLQiKMXyV9oPs3AIpAMuhOltDLrZFeKs+D3DVyhySmrcuvfV6WxdVyTlQEsgGyNQbEs
 XVIhgIvfleGuJouIGDUT3tcZKdRhj8YL8dRPBU9SfbMBHGvKW5H3sxdrSxLdxN+141eJIghECxx
 zsprwGqHnj1Ad9+NAYg==
X-Proofpoint-ORIG-GUID: P5anbn2ShE6ru0LkjW3uZ_OlnS0HDKG5
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b3b8df cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ndT/fs+coltRyMHftQWjTw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Zf8dAvqNuctCz8TeMh0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: P5anbn2ShE6ru0LkjW3uZ_OlnS0HDKG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130057
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97332-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E30927E996
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 9:00 AM, Dmitry Baryshkov wrote:
> The get_instance() is a callback tightly connected to the HFI
> implementation. Move it into the new iris_hfi_sys_ops structure, merging
> all core callbacks into a single vtable.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_common.h |  2 ++
>  drivers/media/platform/qcom/iris/iris_hfi_gen1.h   |  2 --
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 28 ++++++++++----------
>  drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |  1 -
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 30 ++++++++++++----------
>  .../platform/qcom/iris/iris_platform_common.h      |  1 -
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 --
>  .../media/platform/qcom/iris/iris_platform_gen2.c  |  4 ---
>  drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +-
>  9 files changed, 34 insertions(+), 38 deletions(-)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

