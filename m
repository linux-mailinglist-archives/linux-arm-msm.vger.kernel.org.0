Return-Path: <linux-arm-msm+bounces-104283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEy5C6jw6WnzogIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:12:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE62C45068D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 12:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 963C33062C0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 10:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0397637882E;
	Thu, 23 Apr 2026 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oI4haOIQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FMXqMnNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C939733291F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776938712; cv=none; b=pOkXFgx7u/jmBqPyKoc7BTM4DmCk0iAfUvjwh9PaSZRXpOfT8RLbYBJFW6t2waxYwdQnYh/grUJHI8LRIss1AW3TvCTfdjZIeERCSAwCUQBVIpKdwssObzJwAkDUBX7gkUHb5WlWoUM3XgeMiPrgVl7EXEuIxCLKPT4HzIOx0Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776938712; c=relaxed/simple;
	bh=AtsHhQdk1R2iSFELfIutmHP0O9htnP5vJpt1DZ+9sVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BeAegoM/Niek1hlr84WVaPlAj1hvGNWqBUUOj2hIjGx+pjsLtRL031RJxvn8+891lN2qZ+GqEnMmeCU/6lMp++2l9nMYi0qWnT8Lqf7wZ8dVtnttGxLslQpKcIXuuQ0OADnXN91tFq1Ksfukn+LgVTcO2piUmAc90d66a/AXohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oI4haOIQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMXqMnNL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uBgH3294965
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xk8yBIV+gZayPbEyP6gY8oLxoxXEN1Qc8JFKOGEKDmk=; b=oI4haOIQxWA6xlka
	qdmMrRXVwvYUD9A7l+L1VO3XI5hL9lw2O6+FuUvxm8EbXvlgOUG5mjV2SwLTHYVk
	lyiCqDcEsPCZjjYt273tYJIhGTZ/p0ctPe9Y8AJ5l+dZ1YGn8w2WPiw356wU2edB
	Un1sxU/jXiAwrFtldMVlEH3tiIrLH9g6JJENtPwwLGGOh+mdaAnPxu0IFoSrfp2E
	8geFwdOZgpwoWZ0Eidn0ogqRUNnt1oIQa5izFhLbY5spVjHF1xIekBbjHfxaf4LN
	y9wZYIrf2UOsfRF6CPJH3fSr+7shyU82kRB5p8mmeIqgOI9Q7BQu++sPFEdafEl4
	FhVHLw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq282u7r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 10:05:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5073ed1ec6fso19293531cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776938710; x=1777543510; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xk8yBIV+gZayPbEyP6gY8oLxoxXEN1Qc8JFKOGEKDmk=;
        b=FMXqMnNLKOEPra6bT+WBYtuk3SjZYG4WxcleKija0nz5BiKPEoxBBemicVbotgsAS7
         cQuX/VI+AA0LcDIuQ4YRjpu0Tj/Ja3GosIr3BPEkfqRUcrAW8Pt5dnfnjafZLDFlnBK4
         FiWsp1PItFODnV8CtFmcDEmULnLaG9eIiomRp7Wbtp/W9Lg7O/QebmyNkCuiYTiFfO9r
         /raHf5PTu5wWlR/kIRzEPhuFJulx1mFJZMThRC8MP/VPRZswDqqXyMY++ewqChHxRqms
         rv8pEUxzRH/g9uRPlR5tHumEJ5vyg2Cmx0nGl0H7qsTb7a5vXbfzVej+yNj/rh9rJFvC
         eV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776938710; x=1777543510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xk8yBIV+gZayPbEyP6gY8oLxoxXEN1Qc8JFKOGEKDmk=;
        b=Yl+ZxmW4ctxWwZ+agI+u2zzZC3zT8bwyEDtDbu9GzyG+LjBj6cEZZ1gpUJRiUX1vHP
         zNT/cpR3Xv2+DiCnlgiG910gdXveQhvPBqOtd2PlyF6oWa+/qQ6Rp+UwJvDsf7hI8QmM
         W8QIX0T6Ywa6UI+OWNiEAQYrPmm4SrLQ8ljblAn2VzohFzvEP8y0LjS38QG9CJSygSEo
         fgNNVEYiemYrQpc6hSxwwvEzO16coUW0SZwpnOzhaBCkWz1uY06/v34YCxrjVF/G99SQ
         H/W1dR8K5ApmdOLpw1kXc9kIugp6sctDCazEkmXU6tUySEHjD8A/H+1u4ST9gfmom966
         DiwA==
X-Gm-Message-State: AOJu0YziB5d4D0J9i1NtuDKhOnZczkLiQ4dS2zOfycRVLJRbZnUcX7Bz
	i9//MuG8wFY+9uiegPKTeX7b6vu4jhLze5ZIG0xW/nyeiDTnYMDr9RvTlLdyA9j2U47Wr64e3kq
	eJOtTOkIh65jsm/XH6+E5gYJIvpujvfAU/QZMpH4wpyKebaiao3qHi4wv+WMbYTltFSqI
X-Gm-Gg: AeBDiet2JM4JKn5cpnamVU4qXrL3TZ7gvc3ofJuDdLVKUqa1cxcgNuacKcn9mO1543Y
	kFl1CKGqwqB9CamrdpLN88gpYSpN2RN8gCuvnsIh0PrNJ017LGyq0kmau7D1TU76Qkfz+8jwxKH
	CAJge3rygUrQEqRq/My7D5KKT25OFTUG9Ih8mGgKdE30L5PCN/0fkTPA7vyF3qrhvXin9wvfQZl
	HclM5Pt1djXl/pYsA2ueb14tIUPwTQygxXfj8onazukcLgWdcxuJQWjVRz9kmwba/Ifu6Q13u2C
	oxc9MV/MwAwAi0Q/AnLUGH/gYgLEy+UBPq5wyPYK2sESPXEcz5tDO/HnWlgrlpwepJW3oLV9v9/
	kVPIqnl1Hrx9M5YqQUb8KqgVU9KjH73z1HzcfnNOYMDYfyMszPNFKPxhC5i0YIT9/tgqkpbhm0D
	ffNx/gCtV97XKoqg==
X-Received: by 2002:a05:622a:a06:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-50fad4a0f81mr145671011cf.5.1776938710214;
        Thu, 23 Apr 2026 03:05:10 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-50fad4a0f81mr145670701cf.5.1776938709806;
        Thu, 23 Apr 2026 03:05:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45504441bsm634542666b.45.2026.04.23.03.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 03:05:08 -0700 (PDT)
Message-ID: <d4737e01-bbe0-4cdb-b266-82cacdf1e79b@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 12:05:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: qcom: smem: Switch partitions to xarray
To: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com,
        Tony Truong <tony.truong@oss.qualcomm.com>
References: <20260423-smem-v2-1-44c1aed1ce12@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-smem-v2-1-44c1aed1ce12@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5OCBTYWx0ZWRfX9ivLFHo8IJL9
 BCNGh3VptDQ0/XfPtSpqBsDsNj6l9jLLCW9G2o7Bcf4xbrCSQ0HZkKZfxua6m12WEextt7XYNY5
 XjAuOSkiCXY+9wi0VvgUwwZec4rCvqcaN9vbtrTmMPy5pcXXry+NDIqE9CkYeMTaKB1UrDgANHS
 R2KV2wxta9PB1RQAY9YJ1GZblSsa3f9pnoputDOi2U2LuObbHz0yzzhYV0gZEREvYJNAxuX5L+H
 +VsX6X73wK6QQwZot8Fn88crOjjU3mHXjaabI0AeXpqzNpG85OKtvJzs2ggHA+MuN381JSJjAqB
 DN5EM1dR7sm9DhC/EumGWCpTDlV7EFMq4jm9cgfKwT5r7wGZtL52+vTyKDtpYiKLk8UphJVPOho
 CTxw4EhXUxBnQTPAIy96x0DsAByDpxpGQ0tWxil++AoGCeRL3O+TW1gXgAqr002EnbZSR0lQtlV
 8tFXQNsVxO5n5X8Ic0w==
X-Authority-Analysis: v=2.4 cv=Zond7d7G c=1 sm=1 tr=0 ts=69e9eed7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UXCI7_oW_s4cHWwpH7UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 7SV1Ovc1crBqYpmTPmDPzmwt_h_7Eq_X
X-Proofpoint-ORIG-GUID: 7SV1Ovc1crBqYpmTPmDPzmwt_h_7Eq_X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104283-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE62C45068D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/23/26 11:56 AM, Pranav Mahesh Phansalkar wrote:
> From: Tony Truong <tony.truong@oss.qualcomm.com>
> 
> The partitions array is currently statically sized and uses the remote
> host ID as an index.
> 
> Future protocol improvements to allow for more than two hosts in a
> partition will require hostIDs to be bitwise significant integers.
> This will result in large, sparse host IDs that generally exceed the
> current static limit.
> 
> Switch to using xarray to efficiently handle these sparse indices and
> allow for dynamic growth.
> 
> Signed-off-by: Tony Truong <tony.truong@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> ---

Please retain the tags you receive in previous iterations (b4 prep -u)

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # Glymur CRD
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

