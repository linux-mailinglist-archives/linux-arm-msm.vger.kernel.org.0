Return-Path: <linux-arm-msm+bounces-102288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MxULM4d1mluBAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:20:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 120293B9C66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 11:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B60D2300DDC4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 09:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196072EACF2;
	Wed,  8 Apr 2026 09:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7rCm74s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j5afp/XH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63197385528
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639927; cv=none; b=UFjYNyYM7AzKwfkB306QguBrnbvuVmy0tV3CoPhjYj2lgPWGyVZ8D6ltPoR4jpdcZuG5qpUJJ5KzLLz0Cg7T2mB5UvMhBgYims8yqn8ItqkUsGL90rzt/pCjPzAmfOeaqSUZNxiFYvJ10zgpdDYUeoJy2ViJLe6GPw/xeBkXuc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639927; c=relaxed/simple;
	bh=rHs54eKyifg0zRf29w7NPPQaQurNzYkTJX50IBCYI/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TAkJlHhFKxueYFTRcqmmM3OUqS80QMmNvU6C1rDkVV6uuBa2GPlEdeQdBZVtcsos+EYjLWqaLTZbLoC977t3qre0h5enLfOrveo4IAy9/DZYe5jp7JKV3HS+eOp4AcPTwf4wduGFfFtkiPeFmqrmcrtIJiUfy+4oKyQbzg8Zltk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7rCm74s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j5afp/XH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387Q2mh2861191
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 09:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TYggGOjVlT4mp+hDzDKO6HSG3vJzDPA1Z90Dqf0V0ss=; b=C7rCm74sJpazlT6Q
	BRQ2xR826TS7ThDgtH7wb1JkYJLL5v7In94MlDjkHNPj/7NSEFiMaMcOuX89bD4Y
	Kl/eTZUXzOUo+1nmnPOZZVmaTF3zcIwbzz+enOSLuUTEYstNFJmxd4xnrtpUXKeN
	+P/1Ha9Zk4atp64tPOCc0BIIslMQwkCQMosBe4gd5rqaESN9Qf5fxsfRAu+6XxRF
	VdD0pkDWTvCInybbvrQAkvU4DHKjU53xCFri1aMvPgRjYrkjUNRFZ52HkClEu9Xr
	r5Ty3HeEjrV7kQgn34fF/SmP6kfpyylic0fP5Ay+8LakT/uDxeRVhutmVTFew+bA
	nTHOCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddad8t1nw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 09:18:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b9074bd42so19047411cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639924; x=1776244724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYggGOjVlT4mp+hDzDKO6HSG3vJzDPA1Z90Dqf0V0ss=;
        b=j5afp/XHfS+TR1WuzSJvyHg8v4XqnwVg/WdWdv/a4WoiF2CCgxyoJAo/ftKNDDSEHE
         aR0JhUmOXt7apeC42XuSCgFEhlrisI4jwhLXsu8UJu9gK4eJlIF8I5xS958mc+8SCTe7
         8Tf6bQUyya0o/NwVtm4VEapvPQq+nsmqru1+u8sJs3cQlocEbKUxdkkBQJT7uexpC9i/
         Wz++2sAGHTVpDqWZq81F994wlKmg1iofsIxC7cUvDBtQ8xM+11DQg6+1exeT8S5dM7p+
         fnbmOn3AUPzTQgD5yRH+HzkYJIaPASO8oV3uBveNV3CZVDbhQHebNwrIeXArkEIe61MZ
         GNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639924; x=1776244724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYggGOjVlT4mp+hDzDKO6HSG3vJzDPA1Z90Dqf0V0ss=;
        b=goCrOkzeDH/+eZVgZZdDVQ+g7hzdNiP31chaPNE7dFN+55ZkJ+8HzJGT5CoZoCx/O1
         XuvnxXcQdJj+TSvwZubvWyY0A2tybEeIbvXhnuL8fdNg0BsHUg/k/sC8OcjhZdGx70ta
         HfFWaNi5os4NqXcyJwdIOyR9Xc8PhCY2OwADaazo3IoyC3Dbo9UmEyqM6QgbQVRJpX10
         Oe6UI6UiRt1C+NyKqL8eX22qOWAksnvY0j5YskwnrJRKFqToXY6nAHw1fTVnYLCkay4W
         JXoII3ta0VHD0uYHUJlBwnT6YqA7rtzEmrI4TGqrKMub+ya1ncDwSxSoi+O+XkajY88D
         Kgsg==
X-Gm-Message-State: AOJu0YxzMVTYc+VjEUWAPMrJ+5/aaaIOUrFHE6gI99lR5tdZpp7iYudf
	HQfE+PBiyVEQgUx+QTNT8sChjK3VughTkp/RxpMsEMPD2++ybyRRTI1mHseonFQMLJUItVxgvSY
	nZMFYs9mM1ORrQSOuJgd24O+IpogyXC/p9pYwT1f3CRr9Rwnqca46sSl0Tzc6lxUIkhBA
X-Gm-Gg: AeBDiet8ViAEENmxRHKK6C16XKOUEQX4EkB3ZZ1pvOmPOYnXws61z45695Xo5VJIcTm
	2QNAHoJT2V3M6v15RvyY/DpMvY+ohLgpCxUk+QCX2doKwCtdfWaqc/AWAa9MWho4BjYBYys4R3L
	6NBZFtx3N42R/f9ttOfc57mJCnMI9z1hDWy1ugC9kHJe1Puj4bioRUOOfe7JVSv7ibIPqcmkOnW
	URJCVA2cpOyeDMcTgGP1Ej41Z8yHEor/OGdQrVxti2dgeg2Edk32wNiDhgTmzXTaLd+nyTtljAI
	cOwWeO8ZrYSlEBjays8geSBqwyqoLJxxkFFApRpKhWn2LvFCmQQmRStNRLK4tCVweha5XFGtU3n
	GazMaOh0w48pgwHtsXPePsBIi1iDjoTfucXdOBWxHsb/eOe4vUNr6ohjjScEfv4+GGZSnfg88gF
	nVO9k=
X-Received: by 2002:ac8:5d10:0:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50d62d4a14amr214065451cf.8.1775639923875;
        Wed, 08 Apr 2026 02:18:43 -0700 (PDT)
X-Received: by 2002:ac8:5d10:0:b0:509:1b76:e9ba with SMTP id d75a77b69052e-50d62d4a14amr214065171cf.8.1775639923394;
        Wed, 08 Apr 2026 02:18:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cfef4f9sm615267366b.45.2026.04.08.02.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:18:42 -0700 (PDT)
Message-ID: <6e248bd3-1692-453c-9012-cee1bf1cbb8d@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:18:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] arm64: dts: qcom: glymur: Add GPU smmu node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
 <20260405-glymur-gpu-dt-v1-2-2135eb11c562@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260405-glymur-gpu-dt-v1-2-2135eb11c562@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Cjcs0Yec89nPSywhQB-ZV3cYNIC7hqGO
X-Proofpoint-GUID: Cjcs0Yec89nPSywhQB-ZV3cYNIC7hqGO
X-Authority-Analysis: v=2.4 cv=EoDiaycA c=1 sm=1 tr=0 ts=69d61d74 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MiBTYWx0ZWRfX8OkJsbQQFRHK
 +eXU5izD+l27ry+SmQTEUDbJR5hXOokFsJp42HEtJgSe5dSrtAQfiFKdpPQkIOvuPlX0Smlv3Kc
 12RkTZHmn9MpP/IXDGoL87n+d5IOKBbb2YSSS4zk+Tg5naqPh7hzjBssWTL3JQOg8X4rjrqDkSL
 H8ZBCF+tVBMVWKQLPAYk4L/ZvJ1aOl+vrY4wJn58jXzEtmv7Z121WQ4tttqndGhkIxNW4PhHcX2
 ogCig/Mq71FB915Ps0yaN+xLBQU8a4CZ5rjP6RHQeAfEBUhtL8yDqZbs1ckG3AtFokjLXSKi+HV
 UDWFl/nwLGpK8Vh5nN4WO0VVw55CpqAUBa+dm9fffnPUj46q0ljI8xYf/GNSfJ16XS6UjcIXTNU
 MVgVQO6CXTswv0k+rUh+s89xcFnkaRYidzEcTLa4N5Co1995IauirS8/p3NjoSTQ4pjl51NDTe2
 C0d4PbU/n7kmL+yO2XA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080082
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102288-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 120293B9C66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/4/26 11:03 PM, Akhil P Oommen wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Add the nodes to describe the GPU SMMU node.
> 
> Signed-off-by: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

