Return-Path: <linux-arm-msm+bounces-99601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ON/iLQthwmmecAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:01:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A440E3061A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D02C7303D6E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C03B36C9C5;
	Tue, 24 Mar 2026 10:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CHKo1RTl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtdFwoFW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A643CE4A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346430; cv=none; b=jWMh6/223mMQTLs8xzZhFq8+ihlWsEE1++SVcDRHKNvCSrcf7HN3RTNrdEqNk5hOHM+ovtfgwqF4eKhXV/gvGoT7KZweeaGnL63G/stzR+MxDDWWMXOgWIUbigxLcjJbfbVKRlnfZRYSq6UhKyEdFErhj8tiHWtqxryO6Y1GeSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346430; c=relaxed/simple;
	bh=Ub6P1Xxwa05g0RZGfOEQxXEZuKj/fxHw4ztSk7ygSIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=av+YqVRueC9jalbt+kz24SIjsq3TQd90ILPYZMU8JS/dvobopMGN1yfYRNMksN4xqzyAhj2zuqh/RSBdgYs2TUrfZsLoXyeXFckbmKfcNuqNPcf1L4L/PCNKW8wmTUDpflRZ9pQAJTzSScIAaEN2wupFZc/9PRWvxOh2H41Nq7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CHKo1RTl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtdFwoFW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9gYOi890662
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WT0sxJjxN+LdXES7eWwHlBN7cn82bPNexx29FFsAMOU=; b=CHKo1RTllj9tQhcM
	wFF/NhldkqPtJ2AOWhf7AmsLXH8XXiEQqaz/zAjBPCfZDYm6Q8RIaQWRjt9kYyEZ
	UVaGhgkKFzuqOsgVIraZQjF5azCi4r/Pg+WRDDRb3eJllUYu/D7NGR+pOUszQwwp
	TNIbyfW0obMVUQwgCyvDFJwYUssTJx4pulfcOBUwgWddYWJ/gYS8UP5TTsPb1QeJ
	ghgKLUlbhxxxcblZmQr/s9D6wgqLTTt5uPn3EVYrtYv2CGUBEwMnIGfntcI7CsFR
	HCjXdbOIQsZNldfKhivZunvt11BcTXH13hMNlqpmo/3KuYFQiu2vSb5oQfYk7jyA
	+NDiVg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3k1x997e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:00:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfe29579d5so222372585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774346426; x=1774951226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WT0sxJjxN+LdXES7eWwHlBN7cn82bPNexx29FFsAMOU=;
        b=RtdFwoFWbtc0IL9kwOgBFOaVv6lgIYAZrLbPbb7D6XkpXlEcaUglE1DChJuF8j0GgR
         o0KZsgkIFLOebq5nT3dAbjlM0ZiiaJstg6dnXSuzXnKmVOscfjtHo5WA29LsAUpGTC1u
         yZAKCci00v4mtniAdCeNv+2JHni1Lp56GdyZjBiIklp9nn3s52Hn2sQ2M+Ag0rZZk/Er
         VuehKq5Hp7fdTztCqJDbz47+o1YNPQ0JEH0YnN35Dc+2MSvZq8GRr6omuHyf1bCxde2P
         3TFfSZmcA9IF8XPGY/MizQ3nFsX622Lvum2oD1P+XbiiaQh/jnEtWCou3Ld0MeuaFsWN
         K8tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774346426; x=1774951226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WT0sxJjxN+LdXES7eWwHlBN7cn82bPNexx29FFsAMOU=;
        b=AKURwyJyfFXgSHCv5NWWT2yXYKomL1Y1bgD3FccVkZeJKMQjmlWfIPWLmIKrmMhsEq
         SoyIW+wZwxoUdA9jrqZaGMw96r+3j9lVC4fXUW9mgIqw52KaN16fCqaOpxSM4VWe2NSD
         YbR62g01FXd+3V7JX3MdoH7NRs758RXPlPFyavG5ck+aO+w9D9+hpXqtMZ2jpt7Tf6lv
         mUR95XCdODlWFKLaTA+lc3FUK8+tCg0QNKfQfUH8n/IszNvqGoqJ8ufpsUXx0E1PzWOD
         5Nm/AUfp+3abTjo2KC0xq2dObmNqiS3oTfAVbhJHvcJhJwSfOoMuV8DXvGgAxJFyLvK6
         uXZQ==
X-Gm-Message-State: AOJu0Yybu7LD5GHreosA4kZcwxQurQYH6YNXZkpbv7kcZl3Ri0nWOxPT
	H1UHe8jth/xPfIsoFXHtOsgzEnZMM2kEVXZxiD0U5qmkJPXrXkSsmWOXqPoWoOSkW4KgF1DWsut
	WvMXGXKqT6BdcQQApUSCRJ1YnL9s1bT3W8WZnoY7ZUoNKsuSh+olRioJq9/0nhzo6jhZ6
X-Gm-Gg: ATEYQzy2kyDUbK6Ff2FWr51zdhkurUcGgDQutCltMAIh+hzkrfylk1bQ7qPMKVRXKqH
	ytw69tIKRsxvZSioHCeNAeolJ3TtN5my9Za5raTdenx/IMgCQXzel640Pn269HoFGxQjgNaTkL5
	RRGGXsp+G+R0khttipBaKxX4uuU3LV+RUI64bjfGB1cjhEkiDTZvrCJeeS7LcAUfBWjD58Q/FCE
	E4q/Kr1IIWAePVcr0yPHIx23Mdh+D2lbIOSXZszaxQ49+sh4sp28htnyzJCK+1sbD7tb4VFr418
	eIdMGmo8J+qxRUzx5JUHE3TqiK7UzyeMVboEf2MHcei0XUIOUoBuwxc/DHYUhUrLEQAvIvEPNPU
	kPS8enCxTEWGqGcUm9HrEUDJQyMpf4cvRWxLghtKFyFO5/AkRUtsgkL2dh3Js7/V69F+1zH+KW3
	sfDi8=
X-Received: by 2002:a05:620a:294f:b0:8cf:df37:4f6c with SMTP id af79cd13be357-8cfdf375316mr1003162585a.5.1774346425658;
        Tue, 24 Mar 2026 03:00:25 -0700 (PDT)
X-Received: by 2002:a05:620a:294f:b0:8cf:df37:4f6c with SMTP id af79cd13be357-8cfdf375316mr1003153185a.5.1774346424857;
        Tue, 24 Mar 2026 03:00:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66a5f017c83sm119090a12.3.2026.03.24.03.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:00:23 -0700 (PDT)
Message-ID: <30a4cdad-47c0-43f0-9327-04c28eac52ae@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 11:00:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] drm/msm/a6xx: Update HFI definitions
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-8-fc95b8d9c017@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-8-fc95b8d9c017@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3OSBTYWx0ZWRfX5MT+KC+gNl4n
 b0kTKKTnfuoNV8Q8ZGSWfFnsY08Cq43ismLTADG1H5QW7yLlfdPYFJr0hNdyIePBwKpSZKyQ4iP
 pSfoXp7TuLmeLxBd2NLBG+JNtOhhMfUjkZVVugP+A4L6pUXx4Jk8eKRWK2xGM13ijaKLwxZ9t/r
 2RVi7aaGYgWH8UigzryCVebizanS8VDsXLDozwHEnc7IEvQVkAJXsEKFVlnQ5BrjhVBORwotPYh
 z80VzgSkB2J5o/yz1goACqpUer+ATwZ9XGw4CjJLKzcUGhxAFhp9PzcLJoffj6AgN5rpUT2bMic
 8XWStwGHqsWnLb0VIzUYEyq8JL8/CWRFopakEaLO0hdMeE//w4gVzMlGjhGCoL3MwVdIn2NQ8OV
 J0Xdzh1fif6oBIKQUTpDsrtzBz3ggJ8KoJKF1fk8Q4H+dQUXMS4r/q3PI+PWtoukSvb+7vzbhDH
 hsp54foLmdv3nkDDp9Q==
X-Proofpoint-ORIG-GUID: Ycixwur66_NqNEECC5Ku9RPb7FNL69ea
X-Authority-Analysis: v=2.4 cv=O880fR9W c=1 sm=1 tr=0 ts=69c260ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yXWzbejlfdbuXM6ywS4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Ycixwur66_NqNEECC5Ku9RPb7FNL69ea
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99601-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A440E3061A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 9:12 PM, Akhil P Oommen wrote:
> Update the HFI definitions to support additional GMU based power
> features.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +#define CLX_DATA(irated, num_phases, clx_path, extd_intf) \
> +	((extd_intf << 29) |				  \
> +	 (clx_path << 28) |				  \
> +	 (num_phases << 22) |				  \
> +	 (irated << 16))
> +
> +struct a6xx_hfi_clx_domain_v2 {
> +	/**
> +	 * @data: BITS[0:15]  Migration time
> +	 *        BITS[16:21] Current rating
> +	 *        BITS[22:27] Phases for domain
> +	 *        BITS[28:28] Path notification
> +	 *        BITS[29:31] Extra features
> +	 */

My first thought would be to define these as bitfields, i.e.
u16 mitigation_time
u8 current_rating : 6;
u8 num_phases : 6;
u8 path_notification : 1;
u8 extra_features : 3;

(hopefully I counted them right)

You would then not need custom macros to set/get the data

> +	u32 data;
> +	/** @clxt: CLX time in microseconds */

slash-star-star implies kerneldoc, which this isn't - but it would
be appreciated, see e.g. struct qcom_icc_provider in
drivers/interconnect/qcom/icc-rpmh.h

Konrad

