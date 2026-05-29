Return-Path: <linux-arm-msm+bounces-110276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC01IGyVGWrVxggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:32:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4515C602E88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 15:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 164C93054E84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 13:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0432933B6C9;
	Fri, 29 May 2026 13:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vukhh6zx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DP0Rj7Wm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B253F33AD8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780061424; cv=none; b=c3WftvL9+eioKjCbigOTGCcEXNx+EEvHRqU8d6n7/KhJZRWjVYweqhsO0mEnLANqKplXEAyBIGtcZbBulLv+vveZJNqFpPG6GWxb71ynukJwOhr/BW+j9RBtwA/nhovlI9YpJ2KnOqStzdEJc/9MqN1dTvhnIidJVGMdh8zcnSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780061424; c=relaxed/simple;
	bh=MRykT7Ev3snfAOD0gmqt2lYUk2WpxUNUJ/ph6pxTUM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRqHj95G6u7GMYrgrg8/zOaiPJyf2URFfpi5iCB6R0Mtv2reiAfbs9QgxVAtXMwRcvt9wFqFGG+qec0CnhrScDflHLg5nKYagEdgQSW7Uit69WoF6xLXdf1mTPLkYuYrycf1tB73r0o2SbcJ0khx6aYvPoMd6qTMY7Y6yho92bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vukhh6zx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DP0Rj7Wm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLBJm3656464
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 13:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWjqgXqaMryRWoWPpxKyf9wQ2j7ANbAzyzhN2DMzuFg=; b=Vukhh6zxXtDgPfLe
	lWBLq4ebh8PoZTuu+0X7Mv3gSIGoWD5n+ySalceCc8X6mBHY+5ts37JMavRK5Q5t
	suPNECaPJ0fCL8mSJoDNBcXntqXqNPH9bmwXgIZrBVk0Ekw6B3sliLp3U99WMlPJ
	nN10WVlVMe9p3fVi3xsO9lZXTPvgaRat3w401+yN+0tN2qzzwgCE1C4I7fzk3xkw
	NBI2bgwhcxBOrzPi0Gwgg86HoTGg2xUGseiELwZl1vvuYJLV/sa4jjkicUd4Po5P
	gXE591Dw7Q5gR7MChKuWDiN9yA7v2wIUHnuitRND67uJ5ozeG4c0OxsuUVW40Hu2
	IJvubw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety5vd92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 13:30:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf0453031aso26033255ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780061422; x=1780666222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWjqgXqaMryRWoWPpxKyf9wQ2j7ANbAzyzhN2DMzuFg=;
        b=DP0Rj7Wm6sFoddH9Z4aSFaTYcwKZMkMXFOiwL3QK6/XiOEAfOHoSSl4MHEFPg3S1mB
         wK8uZfjHtUS0ceBCLY//U1ruT+Yc/BpDT6kG5a2sbF9ME0JTKgCOOhP6mTs/EPP60YgV
         hSO1fpdVqM4u/Jgzteq00Kit5mel5IbAhLpLfi7TJvWEdPyMMF9kQVBCR2bqlPZ06nOf
         hd9hJIRMiWZq4v6ITvFsQnwn7Wpcs0/tPHE6S9hf8W8fMyR4yPU7ycgPgEf4N2Z1ZaF7
         GB5hEESEqRofo7LFyneZX2duPzMB4UJexmTiubEKRQUR+lRlnvJWH/GXIZzywVSgIxQH
         QZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780061422; x=1780666222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWjqgXqaMryRWoWPpxKyf9wQ2j7ANbAzyzhN2DMzuFg=;
        b=YC9radWWyvgL20BeqqbjxLOByYWRRUCZCdOXB3xZy4dz7k+Aj6SrXYQjyc7oR6ljgY
         92crWvS3CqJ+MZjdS0cUVviLm8aFS4kocL+UYoIjHTb5eWhuFPncvczEWxFkRDIYtHKh
         CiKzqNHtctJqyfQqupUTztpJPa/y3JviKOJNBszsvJvfFcH/kmf142USbdThH0G4JW4W
         8nUTUgc642bP+LjA1A/uP8BmoZrP6f0VXsfnek0KM5DtqSPkxD6GKH4uaReg+yFoJbP6
         LrwCzi8C/6lF3WOv34b4/TX13cJAUHN4PT4LiHWC4OCpNHUz/U3eSQSoD19sroHapbEw
         31og==
X-Forwarded-Encrypted: i=1; AFNElJ9t0zI8p8t/GbNsT+TODSwqdncF+n/YSrBlYPHiyqL1DDiQ9nkrm72+TIyb0B8FFT5fGMU9q5zxOGkQ4r7P@vger.kernel.org
X-Gm-Message-State: AOJu0YyqVrqPHHa8wWDnXOltQWduBvUioNlVRTsB4FwIl053jFEio7Uu
	ZWBBXEMaIlDqgWPFLuk8zLhN/k4N8ICwcBeXwNw9ROndUHVRAFKbs1LCjoyQ1tLFGM042gQLzqH
	POSsUCFOmehHXdsvRFuYE1V0D/atz0kyJ0hpidhNwf/iKrTihjFYn1Y6ZGEKDCx+DsNnR
X-Gm-Gg: Acq92OH8jv1S4qZPSjQPdpTazFgjeXeSJFPpGCzqI+jhAStSLrmwdy4CxlWB4/LNtUP
	GikAbFSvedMUApLKFgJra/BI/JPS7TmLEige/EAfcnJc66arxveMUIwoNmluhuXRKOuB8gmb+Ni
	GpiUVSzyWBOKYHlGClaN4tPNZwKI+ksUeFfdULRwUjEfh4cgn84oL/0fhsBmDHd7jF1PE4lsEmv
	zKwWt2GXCYXmRvwGHZoPGhDw/WIfdJaZI9UkGwwmIHP7EdHl9NihqV/7aLIXN1oph7RrBwJbECE
	Geox7N25F6t0fGDHnJy+n2aE2HI0yMMjs6HgpX/gm5s3p9JK/eDK8tVLQGzTLprOqL9PltuDiDG
	bKYDaLYtJ6aM3yig3NzWD8HI9U64W+4xrVq8NzpFJNAMWVaHNJMS+PVLfMCgzowdI/ZI=
X-Received: by 2002:a17:902:fc43:b0:2bd:8db9:cc0c with SMTP id d9443c01a7336-2bf2050c287mr38769935ad.6.1780061421548;
        Fri, 29 May 2026 06:30:21 -0700 (PDT)
X-Received: by 2002:a17:902:fc43:b0:2bd:8db9:cc0c with SMTP id d9443c01a7336-2bf2050c287mr38768925ad.6.1780061420801;
        Fri, 29 May 2026 06:30:20 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3d6besm21715725ad.74.2026.05.29.06.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 06:30:19 -0700 (PDT)
Message-ID: <0c6636b0-f6c7-49dc-b335-2b4fac16b848@oss.qualcomm.com>
Date: Fri, 29 May 2026 19:00:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 00/13] Implement PSCI reboot mode driver for PSCI
 resets
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mIP22vrLj0jAyBi0qhHs5PBpnLzt9Y3J
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a1994ee cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=C-2j67T39HWltiyTxO0A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: mIP22vrLj0jAyBi0qhHs5PBpnLzt9Y3J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEzNCBTYWx0ZWRfXz+P9Dp9jDgo6
 3PSrKbeMoQ6GJHe5NXGiRl3GrHYo/GO8bGwwwglXcZ0e4aDcQCDhvgc2pfwmupmczgRoJrVpgmr
 25p8Jxl7aiO3r5imEJEb4xqHKWHPht2dWFFny2zZmIdu104rhNVGcnRZTm7qkSRPR4aBzFX5vx+
 cBN9uaqdDrSFjJYUzvowvzRT7kU9ckxBWtZqQ6EK4nVRTAJgeXA4tFt0r5JvEzRTmWHm4jYVwUS
 95qn4ELgVqz1xMf0ZHpzSKsvYbSNqgsuMYBdKhuvLYNC3Mh2EAX/yZUzedJ+x1UsTChZAhTX6r4
 Gml4kOy4l8f/BGOR1/z18wvUDlKho3QVrXkhw+c50L5RtBpN9F3OAOnxjnpD3Dkzuy2iWxXMJF/
 10OuDfP9pq1dKpFddaqQiTwzd/Vly9+BryabXTuixOBP3IrNQO/pdInolT3VI2uXUKScap6OZ2m
 jGM6qyBb2Nn8poZqLtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,collabora.com,quicinc.com,arm.com,rock-chips.com,gmail.com,ettus.com];
	TAGGED_FROM(0.00)[bounces-110276-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4515C602E88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 14-05-2026 19:55, Shivendra Pratap wrote:
> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that will induce
> command-based resets to psci driver for executing the device reset.
> 
> The PSCI system reset calls takes two arguments: reset_type and cookie.
> It defines predefined reset types, such as warm and cold reset, and
> vendor-specific reset types which are SoC vendor specific. To support
> these requirements, the reboot-mode framework is enhanced in two key
> ways:

Hi Lorenzo,

Can you please review the if its aligning towards the suggestion in v20?

thanks,
Shivendra

