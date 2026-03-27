Return-Path: <linux-arm-msm+bounces-100277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOY1EVVoxmnnJgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:21:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4630734352E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 12:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 308E130015B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C6E34751C;
	Fri, 27 Mar 2026 11:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FdpUeDhH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kRPDL0H9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB07433D4FB
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774610193; cv=none; b=A4oK0GXI7O+5vUSQ09jToUST9W3kYu1N/ASYg6RulgxxNLttetPDWM4eKKqVagkzVK1FFay5hEZO8LZNlc6i4vNpJZNtnG5r8RafDB9mpzb5Eh3TWZC6wC89xtrDMgc38Na0U8oY1aaG+52yIPX9k9m0SMvhIh2oVX1B5da0gJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774610193; c=relaxed/simple;
	bh=NtTiii5qnAmcw3ne5RQ1mlhBLZdGfoMTJll4TTaw5dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIkODNXcGue0fltXHSTb0Ul4Vr54iM+giqzpDJfEe88j/NYHyytngfgwox+9Xc0Gw+b3m5foiMUt6PY6vGeeSx/d7MLKZUXhSD8wQ7KNEv5q9+SiWRKM3/08ERsD09ZQEVCIgcKbgn7vDIbYe6pkrTsbZiRb+HWMyH8naJ99CW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FdpUeDhH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kRPDL0H9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6wG1u1710852
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	39M0iU/FwlQ8YQkgSi9icpJ8JQpEnxIpD9a2Onoqisg=; b=FdpUeDhH40V/SjWq
	E0Woyd3uNalX4EiMswBgp2o6ylOq8SovNur7UB5pIZlcVx6oA7yEma897m86vt54
	OvDSR595QnjEmGM3rFEsadMPuHt7dTHgPDoGXXsPvn2h4iWV71scH9YPR4fuJUvT
	BQfvJfQS1YXHDduijTRR8y32wlPIEipFF2/Upz4va3ZAd+rd3SuQrfGU8Hl+NtAg
	WoYoMXtCUGsmPgth94l6TVM65+C1jv9wqwV77uCTDY1N0mEqd4+ZVECZS4dcqSr1
	8e8yhEFzI3YUYJmsG/sbABomsBX4S9xs9Mfrr4q0aJFwso3cs+tAKezDe+dz/3ek
	BdNq7Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvjqwc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 11:16:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so6446846d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 04:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774610188; x=1775214988; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=39M0iU/FwlQ8YQkgSi9icpJ8JQpEnxIpD9a2Onoqisg=;
        b=kRPDL0H9cYywM8Hnzu3J/bPPZR+ZtUjPXAHowSIsa/j+ZkC1Mty5d0Ua+lSTN8/ub6
         XCMEsK+3AVKhT8a2gIfdewpK1+7yeTanxdOBAhp3HLu8Vr120gLKFS4sbjLVZsXFkvhL
         vHeoNdRjzgPML+LXS0NupCSb85J3sUOezSoWCWBhEZQW4ofUUtja9mEpxhhF0r49ZGpe
         Y4uxdqyiuistOqNm5FiS9if0qpluQy9iNYzqu6xLBh1XGpyZ2ALw3rhVPPrTGjCi3UKO
         5R4BIvEFMWurXgsBK4cy8h4fyPoF2Q4rKUoRoqtcI54oviGXICnDCifc0zLAaaO77W0l
         T2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774610188; x=1775214988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=39M0iU/FwlQ8YQkgSi9icpJ8JQpEnxIpD9a2Onoqisg=;
        b=XCIxwICKlAgwdgGzb5O7I9Tu2wSZ2PMltjbRNi1HGU69yH0QrvjwCDd5ZMe+pt5PCy
         5nOgEDdlnxguBtsSPvX6wtR/KkDGXBGj5RCOZ6PFMUeLced5DHEpbHqY8gjAHACp20vR
         OY8Lhu7y2k3KBgpQVl1/2YOnP5mEfDZrKDw43loykLpIsNbMGVglof7dzVdI/NgGJqgZ
         qtvASYyeAy6B3WushCAKpSB2ndphyjbLd1+Jc211aqxtsYPVvAw2IEuDGPOXNiMsgYw4
         CVlB0tQR6jm/7KQ/32v5Zb6eIRQ/PqXEOJnIsLiKiIfZfh07Wlo3n8PZXf9faIlZJrTe
         eAXg==
X-Gm-Message-State: AOJu0YzT6FNehOM8hK34Uc7Gbi3ThRJSvNi7Y9c2LirYoaw0jaymIdFA
	nQheJLEeONwXDAUHfI2VjRnqPUx+x1ceeKTC3iENvhFR2fGxk+gsAjJzCmzCt5wIa7ELI4AYs56
	0SocodWEfOIhDdfyz5KmRppWV7miPPdJ3/CmIJB0kcyC+NeHMzCwTpUXBNtTZRPFCMXPO
X-Gm-Gg: ATEYQzzq1QN2LMFMvu0990IJEdBQnTn2/K6T+9+yYNBdibdB+Q+55lgB/u9Xn7LbeVA
	59z9jPIaVArvVVUK9RB40Z8LF2tKcWyPiMfaGCUNAXQZTPOnLtXr8/mFhNGkwocmQPDXf5lUGde
	YMEMjIgpdEcZYXM9P/LMw8SVvv6ElKT23YVF+/VmDh5w4oDMOKf9MYKIHsoOqaDHgMp3gjy2pnd
	n5/iZF9lullOJvEXI+kO0ouadsXmYnjX1FdBHaJTxrOJZyg18g8tJp3hetkZVS+c22tsXJaj8h0
	ABNmjrR13WvgcReM3w5aUbVpEpdVXGuX8Dhwbp42Efss9VqbFKQ4VjtYRQZ6RKeQfHB3cx2Ls87
	+dKJF25CAVHyXrzdQIzgn/eK6JMKj5iWg2m5lLpc0pnt9j6LlmnY/kz3MIP7NDK85cwxbQTpivq
	2EXkE=
X-Received: by 2002:ad4:5f09:0:b0:89c:d5f4:7b2c with SMTP id 6a1803df08f44-89ce8e419femr19792306d6.5.1774610187929;
        Fri, 27 Mar 2026 04:16:27 -0700 (PDT)
X-Received: by 2002:ad4:5f09:0:b0:89c:d5f4:7b2c with SMTP id 6a1803df08f44-89ce8e419femr19791746d6.5.1774610187393;
        Fri, 27 Mar 2026 04:16:27 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203c2225sm231157166b.37.2026.03.27.04.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 04:16:26 -0700 (PDT)
Message-ID: <f7412989-5454-4877-836b-268ca27c5731@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 12:16:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/17] drm/msm/a6xx: Add soft fuse detection support
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
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
 <20260327-a8xx-gpu-batch2-v2-12-2b53c38d2101@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-12-2b53c38d2101@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nvWGUlOX9ybneNiiQBtlEZHkLvLJ9-gj
X-Proofpoint-ORIG-GUID: nvWGUlOX9ybneNiiQBtlEZHkLvLJ9-gj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3OSBTYWx0ZWRfXzR60Ujnigv8V
 +4L4LRFtlvGfcUQh+Mj5cR9PJ0N8yVyt3qJWHXnPGQOE43Fobwo/FXVG9r+Ny5G4KDahHEsvP5h
 BaDH8gk+H3MdcDrNoVlnuNy6XmuMW50/n2/fXnnuMtVz2c4JB6Yno52BE7usquDa6hEODcgNQje
 4iwsL7Ihi03LdqoZ8MtwKkZZ5n80Kk97IU6B+1llTYaFRIVV9rgGKEFQHQsbPdd73THlPZScpTs
 tGl0Q3wKvx8UiYGEwJzMsDQtltKN/lxDXqTxDA/Xf/IyhRUAUyJ0HbqgfxMvMG/milGga+AN0V8
 Lj81v74AJE3DNJXWd3c7Xg155E8iDWCEJkmFa+I1JA2DuNEoBv75PtS5F8j4V6/sZ1EwzDf3x9G
 1vdY9sKSOiafTZllezvtFfcPfJZ9UcQTCFBWSylfPbYjjpzlVcFIKXivST9hp1mYAmNaBmnCxjV
 kNVixVLCxCf2gBLXUjQ==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c6670c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mI-EeI66H-T0GO0KZ4wA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270079
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100277-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4630734352E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/27/26 1:14 AM, Akhil P Oommen wrote:
> Recent chipsets like Glymur supports a new mechanism for SKU detection.
> A new CX_MISC register exposes the combined (or final) speedbin value
> from both HW fuse register and the Soft Fuse register. Implement this new
> SKU detection along with a new quirk to identify the GPUs that has soft
> fuse support.
> 
> There is a side effect of this patch on A4x and older series. The
> speedbin field in the MSM_PARAM_CHIPID will be 0 instead of 0xffff. This
> should be okay as Mesa correctly handles it. Speedbin was not even a
> thing when those GPUs' support were added.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

My comments here remain

https://lore.kernel.org/linux-arm-msm/20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com/T/#mc97f65496ba60ecfc977bce1b5bb6d3922711ae3

Konrad

