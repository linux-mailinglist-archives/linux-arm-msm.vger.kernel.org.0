Return-Path: <linux-arm-msm+bounces-98769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JQ5IvcJvGkArgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:36:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F02672CCF26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 15:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78EE030ACF4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 14:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAF536606C;
	Thu, 19 Mar 2026 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QarXSthN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQY1xAGI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29572DF6E6
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773930415; cv=none; b=DovjvwDBZXeueNPCbnQDvz2W58DmSJptqGIwMkejig5TvzXHGs2f1WuA2vTn3IfHcMbq0bmt9JVzcHLIABho8CxTwCZJTb32q3rmon847kY8SzJNkyeq6eGe/RxnrJITuB16sFO3sbxnDmRZEH2lalZ3YU+/Hf8sWqo1ireHVF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773930415; c=relaxed/simple;
	bh=gv/hMc9jdlSB/rscIFbQEP/TqOb9j2QNFxeTSfCKR1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=icarSbp3VjVxezRyh09y4q/aOuBKs1QiszVtjl4DPC6Mo/gtsgu/o/Eoqflg8+ltl2uUfoS3lgYiDx6DCsDk6GWmpoWEevmPXSiqlLhe9/WfvXYuHsvtnDdnZLordRgb2fu+B3RLb5ongeF0lGfg1oKG0gDYQRFxo1VvfJOXfoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QarXSthN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQY1xAGI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wrO1027092
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:26:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=; b=QarXSthNOTFkFQkO
	al/Azz2zcOzljz5BjrIOubnbmfGGbJxmmQ6cd3iZzccgYCrqJkS037p8ei3Yw2FW
	fMzY7wYL+M5x2a7CvA7ibvc7ftLepU8jZ7dSDLW/7wr4j35FiC+FuakovAkA5bEm
	oGhBZx90FsY6NawlnD2SuBkSEDvQ96PcWAnwDx73MXSASpvIq5ZWduCJ2vU8umlO
	caIcH0KHhMuAYkUt63XzSI7fCMxfvrzce+sUtWLDPgdWVXG6MaJGGEkZZ+JBYqeT
	9j36iOmD17f1976Lp7w4hBhFRavlaBWubY2hiT8tzn47U08eYCOK0hBVP60sOrdU
	sPGUNw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032kmgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 14:26:52 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-67c21b7d5f8so114203eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 07:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773930411; x=1774535211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=;
        b=GQY1xAGIZYBfMZ8HFqzjBWfRHLQbkLwgn6iJZtpnYTi2+wZvOUzUcGPPiCqlB3/dxf
         U/O/+h/PrHD9s8GAz38hwaetwHdBLy/f2bbHPGcjkgqyNUxz2BN6N1vGWT6sxq0uvpUT
         JYYhtiqnPk8Hgaaow8VEz4c4FvzW99+QFqWrBVEXmsorZ+NBy72CSu5p2kvJVBB4ayy9
         z2+sMrXs+Q/KqSskYyS7xUvK+7UpLdTilzFXEsmeF9wCFTKWls6/eye8yvaVppjsyUGD
         0zEvycxEe3bB8xdHyVM1LJPR/homONc/F4QHunP5SFmufkLRbrzD3xaf5ug/2F/GwAav
         zf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930411; x=1774535211;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WO3yovuzRdjBUY2nE2AcEq49hPJ3M31tQHHQvF6ywA=;
        b=QOWWlpEkX8sZ9lwwG3TKTBCZguGQXAGiUuraPE5XWdOoAlqhrkIFae2Ox9fM52bZtI
         BtB0XKpeBvrIJohUkySSq97/wiHVdDnBOPLawoG4F4UwJ4YucvBxkDQOQLOqWUKZTmhd
         Tf8nk3kkrnMZ6J01l7DROIUP0+yRWbClHI7VYKG70hKH0tqOVaucVqt2h9ndj5AcwF4v
         UQ8TJMw38D7jWB4Ga//+s8VpV3oTJF9QeEQgkiBF0KxkCgeg/IkvnpZDLqjFYsD9Ig1H
         RpQESj8jh+9gPDDSPwx47JPBNyxA1bQg/iJavGkHQ7hOZRNhh5vKhL7WzzxTJ9CqN7Ry
         kEKw==
X-Forwarded-Encrypted: i=1; AJvYcCV61bJUsUjVmz5LeboudiChIN/M92QJE99GFXGgCBCM/PLPcbAaDGBqu7qSAjwOr0mO0bzM8RIFQw9Dd11E@vger.kernel.org
X-Gm-Message-State: AOJu0YyGPwFuFj7pG2tlwTXmJL6gIscA6E796ZkduSqdZjQAtDrkUx8Z
	tqsIUMtGfLmBkhqqFIiJHLBffH0+b4QNo0WwWk5m6hBEfPR+VXHkR7FqQF52USPhN2JJ661pzKf
	LzsDINPjTfe3zY+N4uLlg3iUymHcSIWy1+tw2DHgCDzA2JiDTu2IHayoZeE9PFM1VIRT+
X-Gm-Gg: ATEYQzyWEwZORuziD93e+zeKyk6Jjg8c40FUAna80BObmTeMJqEuzda4ypzfh684GIe
	aaHAOb+sk+r2YOeaq0A5hERVFMQ0P2k4Ek10cVFRLcR1OYTt0/CN2BdGSCxgIlkYPUxdLAWmugy
	56RT6/GLJ4B8RJbJJOlfVobsQNLbmcMkNdyJfayrOkRoq4gggSGFqRyQ2a/UuO0ZckgKfMTiC8E
	38zb4EeEAc9cJGH+YtybFRjLDyh8VUhrhY4GbhKl18Vyn4Y4TZzI7os4stDvJlctOpDN0UZ9m3i
	Fp11pNo+vKI6KPrsuvbwQIaWUOPgfZZoqJAwz/FScYk04+n6HYZzTkukzQRLVglWpHQVgDqCJ1h
	y7B/F+Hdr2zudokrominjucJhLRGzwJgwiMlsOTUdomrjTE2WU/8Yy7HNYW8M+XwMmudabuqnQ6
	uZESg9cD0F9pTM+g==
X-Received: by 2002:a05:6820:61f:b0:67c:1e60:3e90 with SMTP id 006d021491bc7-67c1e604939mr746043eaf.6.1773930411216;
        Thu, 19 Mar 2026 07:26:51 -0700 (PDT)
X-Received: by 2002:a05:6820:61f:b0:67c:1e60:3e90 with SMTP id 006d021491bc7-67c1e604939mr746016eaf.6.1773930410817;
        Thu, 19 Mar 2026 07:26:50 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41bd2d14b63sm5729630fac.16.2026.03.19.07.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 07:26:50 -0700 (PDT)
Message-ID: <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 07:26:46 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath: Use the unified QMI service ID instead
 of defining it locally
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V60BPr5UkpEHx6wLnuZr5FLzo6SvXorN
X-Proofpoint-GUID: V60BPr5UkpEHx6wLnuZr5FLzo6SvXorN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDExNCBTYWx0ZWRfX1ElSfhLbBzUT
 gl5LP3X4Fq0d/PNdmbaRzQczV3l8R/+wVwF3bt1aqQlLn28yB9KO0d5uN/GKpNX5bXn/nf2dYXV
 81kYGCdR8pkzdFPqm3Z4QvfaG+d4vRsz/0XcmDd6BjtlsuNMkbz33vPccSxGJ+br/SO6BDCKFi9
 wE8hkvHLwBWX9uD5HLVFzZRpkLqf58fRH9Bts7+fbJY8j4Qx/cwmRjHy99kwXBhT6XqZaY9AXVg
 NpR9QXs/mO0YRgPGp9UUfSQ/afbkhkMa9J1Nm+f1Bsow+QBB8MfagZGKqliCDTDTMjzRKjrtPeg
 Xw22RuX8VHqLePI2P3b8d5hESRl+QfgMLlahJH+K9QYG2LduzsmpCm4YPImOvEz2sYVZWOv3jXD
 WKKWgGmrvhzrEF2Na4r4uOKf++uJhfS706T3jFHs1voug5KjF0Fc9Q2Khx7pZfB/9iX0fQRpXZ4
 whLqU5vBXajHhdHnJNA==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bc07ac cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yAZrW0GqhKXZdV71gCQA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98769-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F02672CCF26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/2026 10:14 AM, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Bjorn,
Feel free to take this through your tree since I don't think it will conflict
with anything in mine and it will take time for the definition to propagate
back to my tree via the normal workflow (which I would prefer over merging the
immutable branch).

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>



