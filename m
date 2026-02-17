Return-Path: <linux-arm-msm+bounces-93098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GET5E5A3lGlpAgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:40:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C49414A7F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 10:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 127F7300405A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 09:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F62302773;
	Tue, 17 Feb 2026 09:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqfWP1wB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jSdjBIuM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C689310630
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771321227; cv=none; b=DPp/z8djtooNhPsPsq9KZBua4mB043aoMOdpYgiOxUi9763G48ur85G47f3te9VawDR/YFDb4G8zUklbwFOlsx9bm2kq5DhsQpgqdaMi7AnmqQPbyjB8vVx2ypqUzO2faygpKNifS1s0Yy3i3LisMhb/Q/0mT+vkBjsX3wc0PLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771321227; c=relaxed/simple;
	bh=L1F29Ki+C6Jarg+FkXkDy7PdREUWIWmKvMvYGwqJAU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TePwP5WgLf4QGzppnllYUxFhByx/EN0IP+6XfVPUxkzTo8kz8JrV1chQDMjHQYC8jsJPfiJwjSQD5KQ/MmXaRY8ApqI3ouju8bYMrHqr/Hkx8282YjnrI1WbQmkmVDQavcxH5a9SXi0DWuOBNKdn9wXeUu2wuGckH9FcSg0f03w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZqfWP1wB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jSdjBIuM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H9WcxA985284
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bFebxt70OffaHIzG8AkL/K7ZwIi8ATS7zxwHzKYNTw4=; b=ZqfWP1wBIW2arHQv
	fmq26m3UTL3/49uN6OX74gSV69SE3xlZ6E7v9P145qVphbD8lLJNTzaAlSA14ya6
	u4ZoiwNpJrMW+2NaMPLwpIaVbzvpv/mKD2/8rIy1AX6Md5mcDHM14Gdfd97f8jYI
	ojE4SIHmDDz4oiF/Y/GYAcUNXAxv3FaZxx7DgJHR0Raf/RekAZoZIoM5toNo5fFo
	yhAzainorf4z8gpk+u0rWFqoTj5kKAADnZ/CynFx2+mBPdd7IMOMY2RZirSCe43v
	besRIIv1VQw/tr4f6bP2QK8mVWZn8N1xAij/xxK+0F6eNhM94hFIFaoxocge5yBv
	jnfDdw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap1qqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 09:40:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb50dfd542so225768085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 01:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771321224; x=1771926024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bFebxt70OffaHIzG8AkL/K7ZwIi8ATS7zxwHzKYNTw4=;
        b=jSdjBIuMf3yg9HzVHUYdfsqpvHzRISZRpbJrJKcac9nF/6gpjLI5RY3wsY5wMGUox6
         6UoC7sn0S9J7GshKvo7T1ZGC33UGsAF/Y+Gd68LIWI4wuffj+rryutDGosXbScjtsXYT
         LfdzKt2R//7Ti5h4yPwhemwCahhSiE5RnCRYHrWgneisPcPmUhFn5Jr3U2d49U42Lc2I
         DmITwoy4bynsb2JwQDJCEEzQo4tOeuKtSE8N7+NDKo9rxHm37QT+5X/mxdcT5Usa0Cad
         Kde+kjqCmbsGgr5mfu8SR8fk5V8GSqLj/mVPEe5Xx6vdR2X+ydVLfY2bECIYigCTfcWM
         tu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771321224; x=1771926024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bFebxt70OffaHIzG8AkL/K7ZwIi8ATS7zxwHzKYNTw4=;
        b=bfbinRnzH0Zzy0JFwbDZtC8w7+yX1RzoVXPLY1rxqdSDM0oOJwFhmsyQdqqFS3y4gX
         K7kPCs0DfvbOmXRVHX0pW7bPtbx8KBF2eHGkzAVWTjInbOMN0+i/D4oqUSZR7S9XWnQm
         H5Jx4/01VbcsIimKUsy2yrnUbHAb6+rhaWTgmNZBRyaA7lvYq81qG3pJD/+0vSORLxwt
         tBL5wdFy4rpGm9ui/kVTxmoGzxO/O2jm5FOHkakOKYGqswjKU+fg2Sfp6upkKt2M+p/E
         jK4dbqLShmMAeVqanGFN6j+5+H8ErbFJD5LbkwoBMpf0GSfl/Qf+bb9tcEOqypW9DC2P
         6PoA==
X-Forwarded-Encrypted: i=1; AJvYcCVs28/ndpp4EWK9bZb7usXKPfiGNEZ22sv3Oep5FMsilvTXlvH3PYzo7oHjRcScz2zpsV3Ra6D+v9y4NpT6@vger.kernel.org
X-Gm-Message-State: AOJu0YxEqRyn0fiJdUEqveHGbcqWFj2w/1gD8iaO+4FX9Ne8CFKudyjF
	J735oMRmkMwLDDXIp1+5cgtuPlVnq8r0+HrSDckPtifa5JU8h8TJEjzy051CU1I0kDAOMXIMCkr
	hMRzWBPXKO7UG6NinQdBV+wSROg6XH+K1BRjQX535NBNJ1GNGl5WPG6hUkV0fxXilATDB
X-Gm-Gg: AZuq6aKOipE1kuAJAT2C4/I9GLf+ImcFNzIOgYAR6ZfZEXHB5N3iITof4LqX7aiP8J5
	HMNRN78bJmf+3xkqlNHqJf96CkVRgf2xGFimBuhOcZ6aob0iM7LMnpJjLH9PINKhuggtuv4da4U
	ljA0dw6kG17GSF5bglg3MSduNNYUN0r4/8oiQgdnUNOXOK/2vTZocymhGZm+8IWPFyYr02hDZVL
	a8PkZ/GH0fdjKR64YxqhS8SXI8AKPIsrTA+0LXoyTyZXv26Z2DPVaA8Ltq/4QYY9qgZAuyxBBKb
	1yrJaRk3oOvJ0L4OXwYjeh3ZBFNzOunYA8nvDPejuvMEppGKKxga+bg0dOPZNrOofW0i47+UGJm
	oW2qouYngTXUwc2lga9vr40ImMo2vImkGfErd8Ws54BPVhTPqA6STXMujKv7tTWmCdX5B1DE7n4
	aW/dw=
X-Received: by 2002:a05:620a:15b5:b0:8cb:52c2:6f19 with SMTP id af79cd13be357-8cb52c271aamr616331385a.7.1771321224462;
        Tue, 17 Feb 2026 01:40:24 -0800 (PST)
X-Received: by 2002:a05:620a:15b5:b0:8cb:52c2:6f19 with SMTP id af79cd13be357-8cb52c271aamr616328485a.7.1771321224081;
        Tue, 17 Feb 2026 01:40:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7bf7sm329218166b.29.2026.02.17.01.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:40:23 -0800 (PST)
Message-ID: <0fd7a5f7-a983-498d-b18e-5a7efd910410@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:40:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: lemans: add mdss1 display device
 nodes
To: Mani Chandana Ballary Kuntumalla <mkuntuma@qti.qualcomm.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260217071420.2240380-1-mkuntuma@qti.qualcomm.com>
 <20260217071420.2240380-2-mkuntuma@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217071420.2240380-2-mkuntuma@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OSBTYWx0ZWRfX5pjqSZY0y15E
 ZIEJ4BZjPgugP/12E/axMUrWUkLMNZx4vcCItW5B0ZGUjXR4rflaLUDOTZ2Xq1MGH2lkD3IcSZ2
 XMZOggJ0nnBpup82xG4j8IM+mbJATqAHwP9ECLXU3ez4uvYCoa9k5dPZihdFC/IwkDf289RPmJh
 W9xnFFJqi+SHApJ2qTvKW9nNYwoDOkXg/TyCLWa5u7wMA/BsEE8tcO2vRAg2X6DcyKdUEPwLB2h
 q/FSY1BXO8EhUAMOBgkpKQUei70+RatTsmX6E0yMSZ+aVKNI88uOpyp+yZYUrQmw+4hOF3fqleY
 tvpjl++ZCmRlZz4u+Dp42cAZ8qCKCct4h+S+yIRUUGUOpJ3XPhozDJEBGLYKOpo5QFzblldZp36
 Rpes7Q/T8n84lte44awj9QmRl0VVfiGYRY7SD3hxrolcdS9OjcvBHu5ZDWA+kuFzI9cFovO6y+o
 jILlgGA5U72cyh50fwg==
X-Proofpoint-ORIG-GUID: lCYFWcaM6HFcMBKgMuA3v4cCy8UsLfKn
X-Proofpoint-GUID: lCYFWcaM6HFcMBKgMuA3v4cCy8UsLfKn
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=69943789 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=jOm0eYPikRZL3_VOfAkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93098-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[qti.qualcomm.com,oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C49414A7F1
X-Rspamd-Action: no action

On 2/17/26 8:14 AM, Mani Chandana Ballary Kuntumalla wrote:
> From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> 
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

[...]

> +			mdss1_dp0_phy: phy@220c2a00 {
> +				compatible = "qcom,sa8775p-edp-phy";
> +
> +				reg = <0x0 0x220c2a00 0x0 0x200>,

Since you are going to resend already, please uniformly delete the \n
before 'reg'

lg otherwise

Konrad

