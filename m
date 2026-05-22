Return-Path: <linux-arm-msm+bounces-109217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJUUF8YkEGoYUQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:41:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B674B5B15B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:41:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E3313009F96
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A913C416B;
	Fri, 22 May 2026 09:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTn83EGM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iko1IkhV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8F93C342B
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442883; cv=none; b=Ut30e+dLfdG48nEjvsPXX5cr7+t65xW5HvuejIqj099S0uqGc4/RpKQ+x91jdovmpaoagAjExbk9QbE14ZZAu3CkcqehHQ/gLiak1k/NFITxdGVQgq9eBenuRMkUhWVhFOkX819OWFn4waT3ZFeokZuXKcT7mp1NOdQZRgxxCqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442883; c=relaxed/simple;
	bh=zpSiYK0ym4AS+OVnCYvF1c2VXPAirNOP6LPz4zTH7o0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XfAJKOtR4YJAO2z5csd8Ph9IzuBWSTxgYHkX/u5dX/hWOYkjMzca7qrl5TVFm5DN89nOtzD3yBfwW5qCDHtuUTOtQrVa++2JI1+9mQuWr1iFf97SEzLMGuhwWoc46Yi7T1n3aGoJIJHXn37TCaEEWB5kCVM26uACgmEHFfcaWv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTn83EGM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iko1IkhV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M96VD43532232
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fq4BHObcrvqyKiIQ1B6Cme/MxCDXFz9gmMnUXPDD2Wk=; b=bTn83EGMLABe8cQN
	/TKfn+D9uSd6l2jak2XJgHD6cxbRE6E9KW/VNiCUi7Q6yh8ybCIv85doRvFZEGih
	nZ4ZpNcAFqMZtDTbT/Jg0B6lPiIP2NDa3HddEstiNRzbdazASNnpdLOSoacviJjF
	iZGjwHKRRs7l+jOHboE/98iAGDIrB1/7sZNPqHlh1IgJID/IOCdXm9r65Nw5oxzL
	k+Nui/Fytauq6dtQYO8rlzeornbvLBBL9wdQKiaR0Mb0YlcedetQm5N9/OevRPAQ
	vQcnk8i6DOWb2QMGoS8/5FTC/87Eq86fi4Xza6xhCtbFPLpv8hLKsS7fn4APB05v
	bIXGBg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gvees-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:41:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb98b09d3so22717881cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442879; x=1780047679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fq4BHObcrvqyKiIQ1B6Cme/MxCDXFz9gmMnUXPDD2Wk=;
        b=iko1IkhVGLCW+NYQnFMD2Tbj9GcCtOtetqz26yryk5GpcAwS2pjHL6re5Jh2t5Dryu
         JTR68dMc74t6o7rOpxsR9JyvO7iKUx9ttBeSI9gJgMZriWqGCfYmRTWyFsRaBPWpeus+
         s9yYRGsRLfGm5bqSa8kvPt7VZC9YOsq5LA4qNnBzetsU/9lQu12NkJIcC9MSy0qC4d+F
         nbgq2gRrlUMbDRKJoFgXPKSgeDlV/k/on2CaCJf1CKBSDP5b7dWwgncO/PxVquKf7JKW
         /6SA/0P933B7Q4a18VWfW3k0xDI4EFRu/QZMA7xrZcA7TLk+c58iDnr4ceKvxjr0W0EV
         QkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442879; x=1780047679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fq4BHObcrvqyKiIQ1B6Cme/MxCDXFz9gmMnUXPDD2Wk=;
        b=Qn0gchxgjZevbMksGgdIT6NZCNTgAjhr0NsaAZ0FJoCJSwOI7UtnGmzMGwdjdym4qI
         99P8XUTbk02IrKoLJ0uOV4gqZ8hc5ARjYyu2NNp33h9nIKvVg5ZeOI8s+yQi53cyI+vj
         5WO4UxpTQJI6aIyIIDYxUD30cvkM6TTaeqiy3soXmmCxHWEyff4b3af/3L69kn4KaD4N
         PIdx1BP1fW/2XzkW8TXBGY/jicgk+GaYI87+GquqaM4v7jhgQd4N07hpC53iUSegtxfg
         csAL9siYTrDQsdAmBh0z4EJKDGyW+t+o2I/n3dAuxKWvQ0q1+PMsXlcp27BOXxCotVPE
         WQtg==
X-Forwarded-Encrypted: i=1; AFNElJ++6OL6f/NgG7R8WNDnYKIqcWy0L+ofHQKbRCpsWYqOulGwXa8I8l4khbOZH3mnqSTObn7lgoJGCb1M0NoO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzld3Kjz/K9gcODU8L9fGGhJ4OTOHlk4ykxGS4stZMVeteVe6tl
	umGMQFtrhGT9prDE3J0ZhGFBUY9SxzwWtzeChw4TfRqTnNUWX+l5/kRtfysmS+b1LLeOXhGFHRJ
	Wa7s/qiTF3m9YA6sLMjEDec7+hZY2tWYJsqTDRHDXpVt7l/G8YBm5hLCAzq7kL7w/Mcvq
X-Gm-Gg: Acq92OFXJZxSiVrUXtk2U48/JaQ6x+eKgBNfguMclnKTyvW4x/wdwaaY57248BMWgdA
	DbjIorWl8LowVwm0T0oMYl8zE+LlghDoPMicVHLL/n050vqzVc5bHgbtNSiiGsuheJKlamnNSv2
	+s5mQt5LmGvSEt3vOY/p0IcZp97npH34GEXWCirE35kD5tjC4Cuuf3Zn/fFO796fpGDVnnI8eMq
	3hu+PxWIQc5t9Cm9diRRL8ETXHMLZk85U/dWYbMvgnld9A93fQR5jbREA9ccLkoT2TMg20mlTO7
	4FMQ0+lJaKwXeTyYNvDADZXSOsVUJhe64sFgw6e+qWbZfnN4Sdq8zgOOFnFaSSRr+6NNJ2d9LmB
	7/F9l/+zoFpXJsYw9pX1OUDKyg5mfTAkbnuln5tzYP1G5sQ==
X-Received: by 2002:a05:622a:17c7:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-516d43c245emr31559651cf.7.1779442878790;
        Fri, 22 May 2026 02:41:18 -0700 (PDT)
X-Received: by 2002:a05:622a:17c7:b0:50e:5cc1:1de9 with SMTP id d75a77b69052e-516d43c245emr31559471cf.7.1779442878402;
        Fri, 22 May 2026 02:41:18 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc5ecee74sm34905566b.29.2026.05.22.02.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:41:17 -0700 (PDT)
Message-ID: <6f302a66-ca33-414b-bb80-dac5d9ec225b@oss.qualcomm.com>
Date: Fri, 22 May 2026 11:41:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 6/7] drm/msm/adreno: add Adreno 810 GPU support
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
 <20260515-adreno-810-v6-6-fbe04c7203e1@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-adreno-810-v6-6-fbe04c7203e1@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a1024bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Ct3XC8PptM1zmpRJzi8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: uGDmpIqUc9JHx97dm0hP7Zs_3esrjixl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5NSBTYWx0ZWRfX4Egg2oOMTYvv
 5I7TLxO52mLpGzOphO51qu7Q34Mkh/yyAOaz5aXP4AmgO2MzxY2VFm0oRAe+rizXiO2yKn4dP6O
 ByeH2dWZCC9MQxQUfOxScjHZboZop415XNs0P8rFboBZrVhyEcdpJ9CvYeEFHwPKsGSbIeg5Q1D
 SWHs7pBm5wwPTtCdk0aq2I7BFgV4avjkGxv0hiZ3slu2VPb/aCNaa5iZ6YEus1NdmGhSz5fsmfe
 vv9IRx+LhSTY05sq5RvmHfNnwBl2cM3sEMvImKTipRweT4v35tfG0aRGmZpa/OLdN7l4pLYuEyW
 JhZeej9zIF7PEyrDiRWLRyfkQbGWSLUBzKb756BZJ3SZkqa4Urq6h47/s53fenvuPok0snaFsWu
 +xEjs5yp400T5Tqt7g+qbO2vKvuqVJSFM32goo3Uy3NAqQV1DkQsMGmLCnnvxlRtRhP+uzajIOL
 zhgbDHiOrL34Q7j588w==
X-Proofpoint-GUID: uGDmpIqUc9JHx97dm0hP7Zs_3esrjixl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109217-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B674B5B15B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/15/26 7:09 AM, Alexander Koskovich wrote:
> Add catalog entry and register configuration for the Adreno 810
> found in Qualcomm SM7635 (Milos) based devices.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

modulo the speedbin question:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

