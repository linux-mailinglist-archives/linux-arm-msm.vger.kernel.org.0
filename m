Return-Path: <linux-arm-msm+bounces-116834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T+ivGmK+S2oyZgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:40:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE70712167
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:40:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JapYqo/b";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QXWY6x+c;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116834-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116834-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1444C350F6A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED2642088E;
	Mon,  6 Jul 2026 13:04:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FA742087B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 13:04:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343070; cv=none; b=PjFPWvIqUBfLAN5ICek5ODfftCm+Zy/TE0Lyi+XVYh/8qOWF1FJzebHQ7LCTao0i8EGire6iGsZIeeo0ecVaqj6L7vt935msh+HUKnmFxTMpMqK3UGlSPbtDjesbYPr0QH3K8VEJFBjISI2PwNHEDm0eEiaMRkcagU4T97tUBYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343070; c=relaxed/simple;
	bh=9/7QPfKMTMI/CjWRhumszI3/aGbVFOoiMgVoaf9cHw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ol/knd52WZ47Tm0K4PZ40Xgni5QQHzZanpU7QHPeJeHpJ3IGYgsNCDP26jj5E8uKzSy0h5hty0wYwT5O02l18J1yU9YHKQKlVHJcco8tKCcIlgtYZsLrtfL42izaNgMHAbREAz2IewwoUOdVdaMEXl4TNqtzYlstNF2TilEWirQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JapYqo/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXWY6x+c; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax7hI245518
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 13:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pWsnU3ydAXBOIOITNJSSKAM8BpjQAyuQui8bRCBB0A8=; b=JapYqo/b3DOlXT5l
	YMkVOG5SkD+soPzoW2SxJcmivNrwV0JagYLz/i1Yzga4SuyiMddZ9BOzp9AY3VUC
	ZB+ETwaWTBYE6NkT8O6hB3MrGqkwoUBLOLV3OCVJvHIMk1sMG7WbYFJk4EiEDVMK
	A6oAebTAZ9ge/1H5uZTGMSAVfn5v1ItcScKJByUgdfAfZ5qsG6M0NjQbef4hLPlT
	JRh/wZ1lUSLTwa19my23fMtBUNR9r/eJrT7V+Q8J63mMlQIPc6TtTOmCh/ovCzRu
	21f9oUxvn8bpiG4mzCmDG9+Wf1njfa2eNPEuWfVhcHV8EBH/M/igw9ujOvGR0pl7
	y9GzUA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gnb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 13:04:28 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9e40e60b1so143021a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343068; x=1783947868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWsnU3ydAXBOIOITNJSSKAM8BpjQAyuQui8bRCBB0A8=;
        b=QXWY6x+cx2dKGLfJxcCMYyeYgLCK4kvzLzPIr5N53epyzrjAFmAhBsXd4ykBgDewub
         lezYuUVXl4k4CjF+ORKxtn6X5ECF77Kr+MXaOE5hRMjERRILo6N7zf/RCZ+Zw8eLrk46
         xXddJyOeEnr5DLC4qi1m4Lt+biwjFyK/K2B5TjmXJP4qE8JOyvenTiFacgMSmjWUSxJj
         CVvGqNwEAkkGSXFnausahXeKcVbosgIAxIqvS6co8XtKR/kvTlcYeYSDgdAgpusBzW4I
         mTWXT1k6TZ1T7BcQYXz2YDv6u+ES+6n+zj+QoeSV/yGhvQFMYMmvU/9PSdrD7gT3u7yt
         cOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343068; x=1783947868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWsnU3ydAXBOIOITNJSSKAM8BpjQAyuQui8bRCBB0A8=;
        b=iOGyrvDPKQDtbWGU+w6Nb6kRls6lW/FxDzJhoLYx5fqmAaqMlzyVSWbmsv9DE/m4hR
         talOaGZkQ4cM0TTnZJKNS4J0MfmQ+HzpmKxx79AofcRQ/Ua4/9qyYKNilyxCdp6ifpxK
         9XSf43v22fVVy9D/dvFwMSweb2y8VEZEryqs4ZO9d/ZjNuRjnGFPNyHXq6wX6RZ3WMv+
         orMgb8r5VHnFREeyUR67zwBRtt+Hd0NBEySnZesNBmQh06usnqOBupevRX3xtUKjK/F2
         kCstQ8Tk13MBUq8LFXpPCdcYqh0zGUMhahXyAY4Es1wtwzdmscCaaMfBOenk423pR9wI
         v80w==
X-Forwarded-Encrypted: i=1; AFNElJ/zGC7vE0OOW3XM8ny4dYMcM1AAUfWreaRinz7lk54SARdFIIFH6+mUhmdrLsrA6Qleet/ieAl2ZnmcRABp@vger.kernel.org
X-Gm-Message-State: AOJu0YzhycbkZEVPBdhm3xdu+CuwHFUi2LP2cJ+NjepGDA+CtFVvyUqw
	faYnCZq92pj8PXkndJW5ylr61OqUMSdcHXpv2y5ohKD/xE/Z1TCjjl6EUy0+Zp/oaoUZyy+3JGj
	1C31cvmW4D0OI7q5dRD0PSMozztuCyCzJZqUKjm2hzLsOztYFWH0dZ9psWKgHi+F5Ic5a
X-Gm-Gg: AfdE7ckbjjduMuAoJpKH1DXLQX3jLxRq5a68TNFaHU7RJE5tzLepebSUvHxz/jxi/+v
	BH7fTVs886wp/0lIf4ZdcDhPjkNzIYMLdV+1kKF8hPVDmaLHt40ok4JzbIO2KX1Meu8wUN552Ah
	kqLxZfjHdzc83OwIQ2d205HyJ2gsY7dQDaPgLRGdneY2OmgjG67p5piBudu9Ig8l/oqhIUkOEla
	YQfBoijt6u2r6uoIL4QETJTryKNqPzNWcXjp20uRIJLFlXoM5GTbA/BxV0/vIZINSjfHrwZkAqo
	FCki+gBX7Pq3n6vzQbvlKo08wQ3HRJLOJzxt6dwv3SMeYowGFupdVTuuEe8MXPMkDGgZiG5N0uv
	AMogaMlh2dgdTKmrp7JD8btYgroWgPjPPIBQ=
X-Received: by 2002:a05:6830:348d:b0:7e9:e1ca:5316 with SMTP id 46e09a7af769-7eb7f1933cfmr4339231a34.0.1783343067630;
        Mon, 06 Jul 2026 06:04:27 -0700 (PDT)
X-Received: by 2002:a05:6830:348d:b0:7e9:e1ca:5316 with SMTP id 46e09a7af769-7eb7f1933cfmr4339199a34.0.1783343067095;
        Mon, 06 Jul 2026 06:04:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19dbef44sm4216078a12.31.2026.07.06.06.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:04:26 -0700 (PDT)
Message-ID: <b5b46eaa-a579-43c0-9e8a-31dba0481a60@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:04:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] spi: qcom-geni: Fix missing error check on
 pm_runtime_get_sync()
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan
 <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
 <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-2-92feb5a7b926@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-2-92feb5a7b926@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4ba7dc cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=p3Hybbcu0AkdvJTjDJUA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfX4syqMQbIEnlE
 t9kY+7yZSGYOBem3C9DiEIWlyGqyUmX2Php0LvG3FopnWmXB6924HOpgatsE9DCnwB5CIVt50ym
 QW3LQOoDLKVzlf4ealoQlZ9eCPmqbsXMvvbRALxT/F9pllUvRgT8nyn7JsHvWt0tepmta1K1fOu
 /TgL8UXGwe5J2UcZWTYSx14pfvdk+1ayX1K3mGO0wHVqMjAnvLu0KiI/1yUsmXhqoAvcWbVTTZQ
 jfp9X4W1/LHeL9Fcoxj99JjFiwmcQeRcUQzhx9B3wrREyro4aLULbUc5AyYutg20RrltjwnCI6Q
 sZyZD6WQlug2uuVC+ghY8l4Ms8OZOnEa448PTAyT/v1EmtTJ1qkCI8Any5H8aeoqfGjoM43k6Sx
 4YH2Ls0aw/0SAImqFVswRdT1mirdOt5xqnRYKkPj+uULe9YEM/9zbTXRZAJBJJwfZtgnpO/9HRw
 n3ysPdkY4Cm/Y6bA51g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfXyLnGurm2IFjJ
 bNddKJvt1/M0WhZwbcTQerRb1wsuKsqaJc9eQLY/2oaSJFLyEObFcwxGZ73xICNMOeraRtk70H7
 N0TiPU1uUB2mzM5L1+OmRrf7cCdCNt0=
X-Proofpoint-GUID: Tb5zCZKT7pfYGKghvw4hnKgvn8oueyhQ
X-Proofpoint-ORIG-GUID: Tb5zCZKT7pfYGKghvw4hnKgvn8oueyhQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116834-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0AE70712167

On 7/6/26 10:53 AM, Praveen Talari wrote:
> spi_geni_init() calls pm_runtime_get_sync() to power up the device
> before accessing hardware registers, but never checks the return value.
> If the runtime resume fails, the function silently proceeds to read and
> write hardware registers on a device that may not be powered up, leading
> to register access faults.
> 
> Fix this by replacing pm_runtime_get_sync() with the
> PM_RUNTIME_ACQUIRE_IF_ENABLED() macro and checking the result via
> PM_RUNTIME_ACQUIRE_ERR(), propagating any error back to the caller
> immediately before any hardware access occurs.
> 
> Since the macro handles its own cleanup on failure, the out_pm label and
> the corresponding pm_runtime_put() call are no longer needed. Replace
> all goto out_pm paths with direct return ret statements and remove the
> label entirely.
> 
> Fixes: 561de45f72bd ("spi: spi-geni-qcom: Add SPI driver support for GENI based QUP")
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

